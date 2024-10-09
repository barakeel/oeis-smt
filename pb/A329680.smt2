;; sequence(s): A329680
;; terms: 1 1 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
;; small program: 1 div (if (x mod (1 + 2)) <= 0 then 1 else x)
;; fast program: if (((x mod (1 + 2)) * x) - 1) <= 0 then 1 else 0
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf 1 (ite (<= (modf x (+ 1 2)) 0) 1 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (* (modf x (+ 1 2)) x) 1) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
