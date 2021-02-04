#lang racket

(require web-server/servlet
         web-server/servlet-env)
(require racket/cmdline)
(require hostname)


(define port (make-parameter #true))

(define parser
  (command-line
   #:usage-help "hello"
   #:once-each
   [("--port" "-p") PORT "Set port" (port PORT)]
   #:args () (void)))

(define (port-handler p)
  (cond
    [(boolean? p) "20200"]
    [(string? p) (string-append p)]))


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
               #:port (string->number (port-handler (port)))
               #:extra-files-paths
               (list (build-path "./"))
               #:listen-ip #f
               #:servlet-path "/hello"
               #:command-line? #t)
