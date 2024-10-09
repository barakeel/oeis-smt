;; sequence(s): A84526
;; terms: 1 2 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 5 5 5
;; small program: (((((((((((((((x * x) div (1 + (2 + (2 + 2)))) + x) div 2) div 2) div 2) + x) div 2) + x) * 2) + 1) - x) + x) + x) div (2 + x)) + 1
;; fast program: ((((((((((1 + ((((2 + x) * x) div (2 + (2 * (2 + 2)))) + x)) div (2 + (2 + 2))) + 1) + x) + 2) + x) + x) - 1) + x) + x) div (2 + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (+ (- (+ (* (+ (divf (+ (divf (divf (divf (+ (divf (* x x) (+ 1 (+ 2 (+ 2 2)))) x) 2) 2) 2) x) 2) x) 2) 1) x) x) x) (+ 2 x)) 1))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (- (+ (+ (+ (+ (+ (divf (+ 1 (+ (divf (* (+ 2 x) x) (+ 2 (* 2 (+ 2 2)))) x)) (+ 2 (+ 2 2))) 1) x) 2) x) x) 1) x) x) (+ 2 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
