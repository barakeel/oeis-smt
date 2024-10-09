;; sequence(s): A81753
;; terms: 1 1 0 1 1 1 1 1 1 1 1 1 2 2 1 2 2 2 2 2
;; small program: (((x div (1 + 2)) - ((x div 2) mod 2)) div (2 + 2)) + 1
;; fast program: ((1 + (x - (2 * (x mod (1 + 2))))) div (((2 + 1) * 2) * 2)) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (- (divf x (+ 1 2)) (modf (divf x 2) 2)) (+ 2 2)) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ 1 (- x (* 2 (modf x (+ 1 2))))) (* (* (+ 2 1) 2) 2)) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
