;; sequence(s): A104679
;; terms: 252 2772 16632 72072 252252 756756 2018016 4900896 11027016 23279256 46558512 88884432 162954792 288304632 494236512 823727520 1338557220 2125943820 3307023720 5047562520
;; small program: loop2(loop((((2 * (x + x)) + x) div y) + x, y, 1) * x, 1 + (2 + (2 + y)), 2, 1, x)
;; fast program: (loop(((loop(((loop((loop((2 + x) * (((x * x) * x) - x), 1, 2 + x) div (2 * (2 * (2 + (2 + 2))))) * x, 1, 2 + x) * (1 + x)) div (2 + (2 * (2 + 2)))) * x, 1, 2 + x) * (1 + x)) div (2 + (2 + 2))) * x, 1, 2 + x) * (1 + x)) div (2 + (2 * (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 () Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 () Int)
(declare-fun h4 (Int) Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 (Int) Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (divf (+ (* 2 (+ x x)) x) y) x))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) y)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y) h1))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (v1 x y) x))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ 1 (+ 2 (+ 2 y))))))
(assert (= h0 2))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (f5 x) (* (+ 2 x) (- (* (* x x) x) x)))))
(assert (= g5 1))
(assert (forall ((x Int)) (= (h5 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 g5 (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (* (divf (v5 x) (* 2 (* 2 (+ 2 (+ 2 2))))) x))))
(assert (= g4 1))
(assert (forall ((x Int)) (= (h4 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (* (divf (* (v4 x) (+ 1 x)) (+ 2 (* 2 (+ 2 2)))) x))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (h3 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (* (divf (* (v3 x) (+ 1 x)) (+ 2 (+ 2 2))) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (* (v2 x) (+ 1 x)) (+ 2 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
