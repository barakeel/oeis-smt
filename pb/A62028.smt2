;; sequence(s): A62028
;; terms: 0 2 4 6 8 10 12 14 16 18 11 13 15 17 19 21 23 25 27 29
;; small program: (((x div 2) div (1 + (2 + 2))) + (x mod (2 + (2 * (2 + 2))))) + x
;; fast program: (x - ((1 + (2 * (2 + 2))) * (x div (2 + (2 * (2 + 2)))))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (divf x 2) (+ 1 (+ 2 2))) (modf x (+ 2 (* 2 (+ 2 2))))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- x (* (+ 1 (* 2 (+ 2 2))) (divf x (+ 2 (* 2 (+ 2 2)))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
