;; sequence(s): A80460
;; terms: 2 2 6 10 14 14 18 22 26 26 30 34 38 38 42 46 50 50 54 58
;; small program: 2 + (2 * (2 * (((x div 2) + x) div 2)))
;; fast program: 2 + ((((x mod (0 - (2 + 2))) + x) + x) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (* 2 (* 2 (divf (+ (divf x 2) x) 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (+ (+ (modf x (- 0 (+ 2 2))) x) x) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
