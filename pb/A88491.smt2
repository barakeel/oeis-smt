;; sequence(s): A88491
;; terms: 2 3 4 5 3 7 4 9 3 11 3 13 3 15 4 17 3 19 3 21
;; small program: loop(((((if (loop(x * x, 2, 2 + 2) mod (2 + x)) <= 0 then 1 else x) + x) mod 2) + 1) mod (1 + x), 1 - (x mod 2), x) + 2
;; fast program: loop(((((if (loop((x * x) * x, 1, 2 + 2) mod (2 + x)) <= 0 then 1 else x) + x) mod 2) + 1) mod (1 + x), 1 - (x mod 2), x) + 2
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 () Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (modf (+ (modf (+ (ite (<= (modf v1 (+ 2 x)) 0) 1 x) x) 2) 1) (+ 1 x)))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (modf x 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 2))))
(assert (forall ((x Int)) (= (f3 x) (* (* x x) x))))
(assert (= g3 1))
(assert (= h3 (+ 2 2)))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (= v3 (u3 g3 h3)))
(assert (forall ((x Int)) (= (f2 x) (modf (+ (modf (+ (ite (<= (modf v3 (+ 2 x)) 0) 1 x) x) 2) 1) (+ 1 x)))))
(assert (forall ((x Int)) (= (g2 x) (- 1 (modf x 2)))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v2 x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
