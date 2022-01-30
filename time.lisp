;;;; ***********************************************************************
;;;; 
;;;; Name:          uri.lisp
;;;; Project:       URI utilities
;;;; Purpose:       function definitions
;;;; Author:        mikel evins
;;;; Copyright:     2021 by mikel evins
;;;;
;;;; ***********************************************************************

(in-package #:net.bardcode.time)

(defun timestamp-now ()
  (let* ((seconds (get-universal-time))
         (now (local-time:now))
         (microseconds (local-time:timestamp-microsecond now)))
    (+ (* seconds 1000000)
       microseconds)))

(defun timestamp->local-time (timestamp)
  (multiple-value-bind (secs usecs) (truncate timestamp 1000000)
    (local-time:timestamp+ (local-time:universal-to-timestamp secs)
                           (* usecs 1000) :nsec)))

;;; (timestamp->local-time (timestamp-now))

(defun now-string ()
  (let* ((now (local-time:now)))
    (local-time:to-rfc3339-timestring now)))

;;; (now-string)

(defmethod timestamp-string? (thing) nil)

(defmethod timestamp-string? ((thing string))
  (handler-case (local-time:parse-rfc3339-timestring thing)
    (local-time:invalid-timestring (err) nil)))

#+nil (timestamp-string? "foo")
#+nil (timestamp-string? (now-string))
