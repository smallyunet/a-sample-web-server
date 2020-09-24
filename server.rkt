#lang racket

(require web-server/servlet
         web-server/servlet-env)
(require racket/cmdline)
(require hostname)


(define port (make-parameter #true))

(define (start req)
  (response/xexpr
   `(html (head (title "Hello world!"))
          (body (p "Hey out there!")))))

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

(define (getIpAddr)
  (car (get-ipv4-addrs)))

(printf "Your web application is running at http://~a:~a/hello \n" (getIpAddr) (port-handler (port)))

(serve/servlet start
               #:port (string->number (port-handler (port)))
               #:extra-files-paths
               (list (build-path "./"))
               #:listen-ip #f
               #:servlet-path "/hello"
               #:command-line? #t)
