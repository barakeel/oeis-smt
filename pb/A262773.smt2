;; sequence(s): A262773
;; terms: 0 2 4 6 8 11 13 15 17 20 22 24 26 29 31 33 35 38 40 42
;; small program: (((x mod (1 + (x div 2))) div 2) + x) + x
;; fast program: ((((if x <= 0 then 1 else x) - 1) div (2 + 2)) + x) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (divf (modf x (+ 1 (divf x 2))) 2) x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (- (ite (<= x 0) 1 x) 1) (+ 2 2)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
