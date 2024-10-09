;; sequence(s): A137719
;; terms: 0 2 1 2 3 3 3 5 4 5 6 6 6 8 7 8 9 9 9 11
;; small program: (((x mod (1 + 2)) mod 2) - (x div 2)) + x
;; fast program: ((((2 - x) * x) mod (1 + 2)) - (x div 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (modf (modf x (+ 1 2)) 2) (divf x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (modf (* (- 2 x) x) (+ 1 2)) (divf x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
