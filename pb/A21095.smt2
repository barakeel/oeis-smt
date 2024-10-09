;; sequence(s): A21095
;; terms: 0 1 0 9 8 9 0 1 0 9 8 9 0 1 0 9 8 9 0 1
;; small program: (((((x div (1 + 2)) mod 2) * 2) * 2) * 2) + (x mod 2)
;; fast program: ((2 - x) * ((2 - (x mod 2)) * x)) mod (2 * (2 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (* (* (modf (divf x (+ 1 2)) 2) 2) 2) 2) (modf x 2)))))
(assert (forall ((x Int)) (= (fast x) (modf (* (- 2 x) (* (- 2 (modf x 2)) x)) (* 2 (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
