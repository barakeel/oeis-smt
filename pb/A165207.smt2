;; sequence(s): A165207
;; terms: 2 2 4 4 2 2 4 4 2 2 4 4 2 2 4 4 2 2 4 4
;; small program: 2 + (2 * ((x div 2) mod 2))
;; fast program: 2 + (((x * x) - x) mod (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (* 2 (modf (divf x 2) 2))))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (modf (- (* x x) x) (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
