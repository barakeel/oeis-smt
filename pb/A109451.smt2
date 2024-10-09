;; sequence(s): A109451
;; terms: 1 3 2 5 4 6 7 8 9 11 10 13 12 14 15 16 17 19 18 21
;; small program: 1 + (((x mod 2) - ((((x div 2) + x) div 2) mod 2)) + x)
;; fast program: (((((x - 1) div (2 + 2)) + x) mod 2) + (x mod 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (- (modf x 2) (modf (divf (+ (divf x 2) x) 2) 2)) x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (modf (+ (divf (- x 1) (+ 2 2)) x) 2) (modf x 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
