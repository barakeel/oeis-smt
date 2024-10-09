;; sequence(s): A40029
;; terms: 5 1 10 1 10 1 10 1 10 1 10 1 10 1 10 1 10 1 10 1
;; small program: if (x mod 2) <= 0 then ((1 + (2 + 2)) * (if x <= 0 then 1 else 2)) else 1
;; fast program: loop(1, x mod 2, (1 + (2 + 2)) * (if x <= 0 then 1 else 2))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (ite (<= (modf x 2) 0) (* (+ 1 (+ 2 2)) (ite (<= x 0) 1 2)) 1))))
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (modf x 2))))
(assert (forall ((x Int)) (= (h0 x) (* (+ 1 (+ 2 2)) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
