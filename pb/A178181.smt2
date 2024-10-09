;; sequence(s): A178181
;; terms: 0 5 10 16 21 27 32 38 43 49 54
;; small program: ((2 * (x + x)) + (x mod (1 + (x div 2)))) + x
;; fast program: ((2 * (x + x)) + (((if x <= 0 then 2 else x) - 1) div 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (* 2 (+ x x)) (modf x (+ 1 (divf x 2)))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* 2 (+ x x)) (divf (- (ite (<= x 0) 2 x) 1) 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
