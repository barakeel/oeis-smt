;; sequence(s): A334320
;; terms: 0 0 1 1 5 6 13 15 25 28 41 45 61 66 85 91 113 120 145 153
;; small program: (0 - x) mod (1 + ((x div 2) * x))
;; fast program: 1 + (((x div 2) * x) - (if x <= 0 then 1 else x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (modf (- 0 x) (+ 1 (* (divf x 2) x))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (- (* (divf x 2) x) (ite (<= x 0) 1 x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
