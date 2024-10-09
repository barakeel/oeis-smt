;; sequence(s): A70692
;; terms: 0 1 2 0 4 5 0 7 8 0 1 2 0 4 5 0 7 8 0 1
;; small program: (if (x mod (1 + 2)) <= 0 then 0 else x) mod (1 + (2 * (2 + 2)))
;; fast program: ((2 - (x * x)) * ((x * x) * x)) mod (1 + (2 * (2 + 2)))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (modf (ite (<= (modf x (+ 1 2)) 0) 0 x) (+ 1 (* 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (modf (* (- 2 (* x x)) (* (* x x) x)) (+ 1 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
