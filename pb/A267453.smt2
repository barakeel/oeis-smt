;; sequence(s): A267453
;; terms: 0 2 3 5 5 8 7 10 11 12 12 16 15 17 18 20 20 23 22 25
;; small program: (((((2 + x) * x) mod (2 + (2 + 2))) + (x div 2)) div 2) + x
;; fast program: (((2 * (((2 + x) * x) mod (2 + (2 + 2)))) + x) div (2 + 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (+ (modf (* (+ 2 x) x) (+ 2 (+ 2 2))) (divf x 2)) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (* 2 (modf (* (+ 2 x) x) (+ 2 (+ 2 2)))) x) (+ 2 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
