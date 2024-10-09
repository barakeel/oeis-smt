;; sequence(s): A241814
;; terms: 1 1 1 2 2 4 2 5 4 7
;; small program: (((1 + 2) * ((x div 2) div (2 - (x mod 2)))) div 2) + 1
;; fast program: (((1 + 2) * (x div (2 * (2 - (x mod 2))))) div 2) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (* (+ 1 2) (divf (divf x 2) (- 2 (modf x 2)))) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (* (+ 1 2) (divf x (* 2 (- 2 (modf x 2))))) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
