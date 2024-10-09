;; sequence(s): A173014
;; terms: 1 0 3 4 7 0 3 4 7 0 3 4 7 0 3 4 7 0 3 4
;; small program: (((((if x <= 0 then 1 else x) - 1) mod (2 + 2)) * 2) - (x mod 2)) + 1
;; fast program: ((((2 * (x * x)) - x) * x) - 1) mod (if x <= 0 then 2 else (2 * (2 + 2)))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (* (modf (- (ite (<= x 0) 1 x) 1) (+ 2 2)) 2) (modf x 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (modf (- (* (- (* 2 (* x x)) x) x) 1) (ite (<= x 0) 2 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
