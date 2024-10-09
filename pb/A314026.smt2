;; sequence(s): A314026
;; terms: 1 5 11 15 20 25 29 35 40 45 51 55 60 65 69 75 80 85 91 95
;; small program: ((((((((((2 - ((x div (2 + 2)) mod 2)) + x) div (2 + 2)) + (if x <= 0 then 1 else x)) + x) * 2) * 2) + 1) div (1 + 2)) + x) + x
;; fast program: (((((((((2 * ((1 + (x div (2 * (2 + 2)))) + x)) div (1 + 2)) + (if x <= 0 then 1 else x)) + x) * 2) * 2) + 1) + x) div (1 + 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (+ (* (* (+ (+ (divf (+ (- 2 (modf (divf x (+ 2 2)) 2)) x) (+ 2 2)) (ite (<= x 0) 1 x)) x) 2) 2) 1) (+ 1 2)) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ (+ (* (* (+ (+ (divf (* 2 (+ (+ 1 (divf x (* 2 (+ 2 2)))) x)) (+ 1 2)) (ite (<= x 0) 1 x)) x) 2) 2) 1) x) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
