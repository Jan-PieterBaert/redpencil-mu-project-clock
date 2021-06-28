(in-package :mu-cl-resources)

(define-resource car ()
  :class (s-prefix "schema:Car")
  :properties `((:brand :string ,(s-prefix "schema:Brand")
                        :required)
                (:model :string ,(s-prefix "schema:ProductModel")
                        :required)
                )
  :resource-base (s-url "http://semte.baert.jp.net/cars/v0.1/")
  :on-path "cars")
