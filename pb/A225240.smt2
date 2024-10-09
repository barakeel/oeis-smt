;; sequence(s): A225240
;; terms: 1 3 5 7 10 12 14 16 17 19 21 23 26 28 30 32 33 35 37 39
;; small program: 1 + (((((x div 2) div 2) mod 2) + x) + x)
;; fast program: 1 + ((((x div (2 + 2)) mod 2) + x) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (+ (modf (divf (divf x 2) 2) 2) x) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (+ (modf (divf x (+ 2 2)) 2) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
