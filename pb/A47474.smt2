;; sequence(s): A47474
;; terms: 0 2 3 8 10 11 16 18 19 24 26 27 32 34 35 40 42 43 48 50
;; small program: (2 * ((x div (1 + 2)) + x)) - ((x mod (1 + 2)) div 2)
;; fast program: (((((1 - x) div (1 + 2)) - (x mod (1 + 2))) + x) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* 2 (+ (divf x (+ 1 2)) x)) (divf (modf x (+ 1 2)) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (- (divf (- 1 x) (+ 1 2)) (modf x (+ 1 2))) x) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
