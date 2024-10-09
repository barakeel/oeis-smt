;; sequence(s): A164135
;; terms: 7 40 54 87 101 134 148 181 195 228 242 275 289 322 336 369 383 416 430 463
;; small program: (((2 * (2 * (2 + (2 * ((((x mod 2) + x) + x) + x))))) - 1) + (x mod 2)) - (x div 2)
;; fast program: (((((1 + ((2 * (((x mod 2) + x) + x)) + x)) * (1 + (2 * (2 + 2)))) div 2) + 1) + 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (+ (- (* 2 (* 2 (+ 2 (* 2 (+ (+ (+ (modf x 2) x) x) x))))) 1) (modf x 2)) (divf x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf (* (+ 1 (+ (* 2 (+ (+ (modf x 2) x) x)) x)) (+ 1 (* 2 (+ 2 2)))) 2) 1) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
