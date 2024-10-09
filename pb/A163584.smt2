;; sequence(s): A163584
;; terms: 0 1 0 0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0
;; small program: (((((1 + (x div (1 - (2 * (2 + (2 + 2)))))) div 2) + 1) + x) mod (1 + 2)) div 2
;; fast program: (((1 + ((2 * (2 + 2)) + x)) mod (2 + (2 * (2 + (2 * (2 + 2)))))) mod (1 + 2)) mod 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (modf (+ (+ (divf (+ 1 (divf x (- 1 (* 2 (+ 2 (+ 2 2)))))) 2) 1) x) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (modf (modf (modf (+ 1 (+ (* 2 (+ 2 2)) x)) (+ 2 (* 2 (+ 2 (* 2 (+ 2 2)))))) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
