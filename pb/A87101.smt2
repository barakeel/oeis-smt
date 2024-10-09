;; sequence(s): A87101
;; terms: 0 0 0 0 1 1 0 1 1
;; small program: (2 mod (if (x mod (1 + 2)) <= 0 then 1 else x)) div 2
;; fast program: ((if (x - 2) <= 0 then 0 else x) * x) mod (1 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (modf 2 (ite (<= (modf x (+ 1 2)) 0) 1 x)) 2))))
(assert (forall ((x Int)) (= (fast x) (modf (* (ite (<= (- x 2) 0) 0 x) x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
