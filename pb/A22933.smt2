;; sequence(s): A22933
;; terms: 0 1 1 0 1 1 0 1 1 0 1 1 1 0 1 1 0 1 1 0
;; small program: ((((1 + x) mod (1 + (2 * (2 + (2 + 2))))) mod (1 + 2)) + 1) mod 2
;; fast program: if ((((2 + x) mod (1 + (2 * (2 + (2 + 2))))) mod (1 + 2)) - 1) <= 0 then 1 else 0
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (modf (+ (modf (modf (+ 1 x) (+ 1 (* 2 (+ 2 (+ 2 2))))) (+ 1 2)) 1) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (modf (modf (+ 2 x) (+ 1 (* 2 (+ 2 (+ 2 2))))) (+ 1 2)) 1) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
