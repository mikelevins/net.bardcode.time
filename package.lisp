;;;; package.lisp

(defpackage #:net.bardcode.time
  (:use #:cl)
  (:export #:now-string #:timestamp->local-time #:timestamp-now #:timestamp-string?))
