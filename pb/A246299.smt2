;; sequence(s): A246299
;; terms: 2 8 14 21 27 33 39 46 52 58 65 71 77 83 90 96 102 109 115 121
;; small program: (((((1 + ((((x div 2) div 2) div 2) + x)) div (2 + 2)) + 2) + x) + x) + (2 * (x + x))
;; fast program: (1 + ((((1 + ((x div (2 * (2 + 2))) + x)) div (2 + 2)) + x) + x)) + (1 + (2 * (x + x)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (+ (divf (+ 1 (+ (divf (divf (divf x 2) 2) 2) x)) (+ 2 2)) 2) x) x) (* 2 (+ x x))))))
(assert (forall ((x Int)) (= (fast x) (+ (+ 1 (+ (+ (divf (+ 1 (+ (divf x (* 2 (+ 2 2))) x)) (+ 2 2)) x) x)) (+ 1 (* 2 (+ x x)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
