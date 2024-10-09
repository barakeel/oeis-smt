;; sequence(s): A216865
;; terms: 8 8 ~8 8 8 40 56 104 136 200 248 328 392 488 568 680 776 904 1016 1160
;; small program: (((((1 - x) - (((2 - x) * x) div 2)) + (x mod 2)) * 2) * 2) * 2
;; fast program: (((((((((x * x) - 1) div (2 + 2)) - x) + 1) * 2) * 2) + 2) * 2) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (* (* (+ (- (- 1 x) (divf (* (- 2 x) x) 2)) (modf x 2)) 2) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (* (* (+ (* (* (+ (- (divf (- (* x x) 1) (+ 2 2)) x) 1) 2) 2) 2) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
