;; sequence(s): A14689
;; terms: 1 1 2 3 6 7 10 11 14 19 20 25 28 29 32 37 42 43 48 51
;; small program: compr((2 + (2 * loop(x + x, x, x))) mod (1 + x), 1 + x) - x
;; fast program: (((compr((((if ((((((2 * loop(x * x, 2, loop(x + x, x div 2, 1))) * (1 + (x mod 2))) mod (1 + (x + x))) - 1) mod (1 + x)) - 1) <= 0 then (1 + x) else 1) mod (1 + x)) mod 2) mod (1 + x), x) * 2) + 2) - (if x <= 0 then 1 else 2)) - x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun t2 (Int) Int)
(declare-fun u2 (Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ x x))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (modf (+ 2 (* 2 (v1 x))) (+ 1 x)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) x))))
(assert (forall ((x Int)) (= (f3 x) (* x x))))
(assert (= g3 2))
(assert (forall ((x Int)) (= (f4 x) (+ x x))))
(assert (forall ((x Int)) (= (g4 x) (divf x 2))))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (h3 x) (v4 x))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (modf (modf (modf (ite (<= (- (modf (- (modf (* (* 2 (v3 x)) (+ 1 (modf x 2))) (+ 1 (+ x x))) 1) (+ 1 x)) 1) 0) (+ 1 x) 1) (+ 1 x)) 2) (+ 1 x)))))
(assert (forall ((x Int)) (= (g2 x) x)))
(assert (forall ((x Int)) (= (t2 x) (ite (<= (f2 x) 0) x (t2 (+ x 1))))))
(assert (forall ((x Int)) (= (u2 x) (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x)))))
(assert (forall ((x Int)) (= (fast x) (- (- (+ (* (v2 x) 2) 2) (ite (<= x 0) 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
