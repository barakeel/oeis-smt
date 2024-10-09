;; sequence(s): A40249
;; terms: 16 3 4 3 32 3 4 3 32 3 4 3 32 3 4 3 32 3 4 3
;; small program: (((if (x mod (2 + 2)) <= 0 then (2 * (2 + 2)) else 1) * 2) * (if x <= 0 then 1 else 2)) - (x mod 2)
;; fast program: (2 * loop(2 * (2 * (x + x)), 1 - (x mod (2 + 2)), if x <= 0 then 1 else 2)) - (x mod 2)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- (* (* (ite (<= (modf x (+ 2 2)) 0) (* 2 (+ 2 2)) 1) 2) (ite (<= x 0) 1 2)) (modf x 2)))))
(assert (forall ((x Int)) (= (f0 x) (* 2 (* 2 (+ x x))))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (modf x (+ 2 2))))))
(assert (forall ((x Int)) (= (h0 x) (ite (<= x 0) 1 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (v0 x)) (modf x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
