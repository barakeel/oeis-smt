;; sequence(s): A15582
;; terms: 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0
;; small program: if (x mod loop(1 + (x + x), 2, 2)) <= 0 then 1 else 0
;; fast program: if (x mod (1 + (2 + (2 * (2 + 2))))) <= 0 then 1 else 0
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (ite (<= (modf x v0) 0) 1 0))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (modf x (+ 1 (+ 2 (* 2 (+ 2 2))))) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
