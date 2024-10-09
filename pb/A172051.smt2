;; sequence(s): A172051
;; terms: 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0 0
;; small program: (x mod (2 + (x mod 2))) div 2
;; fast program: if ((1 + x) mod (2 + (2 + 2))) <= 0 then 1 else 0
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (modf x (+ 2 (modf x 2))) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (modf (+ 1 x) (+ 2 (+ 2 2))) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
