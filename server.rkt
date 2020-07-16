#lang racket

(require web-server/servlet
         web-server/servlet-env)

(require racket/cmdline)


(define port (make-parameter #false))

(define (start req)
  (response/xexpr
   `(html (head (title "Hello world!"))
          (body (p "Hey out there!")))))

(define parser
  (command-line
   #:usage-help "hello"
   #:once-each
   [("-p" "--port") PORT "Set port" (port PORT)]
   #:args () (void)))

(define (port-handler p)
  (cond
    [(boolean? p) "8000"]
    [(string? p) (string-append p)]))


(serve/servlet start
               #:port (string->number (port-handler (port)))
               #:extra-files-paths
               (list (build-path "./"))
               #:command-line? #f)

