;; sequence(s): A193768
;; terms: 2 3 4 4 6 7 7 8 10 10 11 12 13 14 15 16 17 18 19 20
;; small program: (if ((x div (1 + 2)) - (x mod (1 + 2))) <= 0 then 2 else 1) + x
;; fast program: (if ((1 - (2 * (2 * (x div (1 + 2))))) + x) <= 0 then 1 else 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (ite (<= (- (divf x (+ 1 2)) (modf x (+ 1 2))) 0) 2 1) x))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (+ (- 1 (* 2 (* 2 (divf x (+ 1 2))))) x) 0) 1 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
