;; sequence(s): A62299
;; terms: 0 0 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 5 6 6
;; small program: ((((1 - (((x div 2) div 2) div 2)) div (1 + 2)) + 1) + x) div (1 + 2)
;; fast program: (((2 * (2 + x)) - (x div (2 * (2 + 2)))) + x) div (1 + (2 * (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ (+ (divf (- 1 (divf (divf (divf x 2) 2) 2)) (+ 1 2)) 1) x) (+ 1 2)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (- (* 2 (+ 2 x)) (divf x (* 2 (+ 2 2)))) x) (+ 1 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
