;; sequence(s): A23806
;; terms: 0 1 2 3 4 5 6 7 8 9 10 11 12 14 15 16 17 18 19 20
;; small program: (((x mod (1 + (x div 2))) div 2) div (1 + 2)) + x
;; fast program: (((if x <= 0 then 1 else x) - 1) div (2 * (2 + (2 + 2)))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (divf (modf x (+ 1 (divf x 2))) 2) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (- (ite (<= x 0) 1 x) 1) (* 2 (+ 2 (+ 2 2)))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
