#lang racket

(require web-server/servlet
         web-server/servlet-env)
(require racket/cmdline)
(require hostname)


(define port (make-parameter #true))

(define parser
  (command-line
   #:usage-help "V0.0.7"
   #:once-each
   [("--port" "-p") PORT "Set port" (port PORT)]
   #:args () (void)))

(define (port-handler p)
  (cond
    [(boolean? p) 20200]
    [(string? p)
     (define n (string->number p))
     (if (and n (exact-integer? n) (<= 0 n) (<= n 65535))
         n
         (error 'port "invalid port number ~a" p))]))


(define (printIpAddr)
  (define ips (get-ipv4-addrs #:localhost? #t))
  (for ([ip ips])
    (printf "Your web application is running at http://~a:~a/hello \n" ip (port-handler (port)))))

(printIpAddr)


(define (start req)
  (response/xexpr
   `(html (head (title "Hello world!"))
          (body (p "Hey out there!")))))

(serve/servlet start
               #:port (port-handler (port))
               #:extra-files-paths
               (list (build-path "./"))
               #:listen-ip #f
               #:servlet-path "/hello"
               #:command-line? #t)
