;; sequence(s): A265104
;; terms: 8 26 35 80 89 107 116 242 251 269 278 323 332 350 359 728 737 755 764 809
;; small program: (((compr(loop(if (x mod 2) <= 0 then (x div (1 + 2)) else 1, 2 + x, x), 1 + x) * (1 + 2)) div 2) * (1 + 2)) - 1
;; fast program: (loop((((((loop(((((loop((((((loop(((((loop((((((loop(((((loop((((((loop(((((loop2(x - y, y div 2, x, x, x) + x) * (1 + 2)) + 1) - x) - x, 1, x div 2) + x) * (1 + 2)) - 1) - 2) - x) - x, 1, x div 2) + x) * (1 + 2)) + 1) - x) - x, 1, x div 2) + x) * (1 + 2)) - 1) - 2) - x) - x, 1, x div 2) + x) * (1 + 2)) + 1) - x) - x, 1, x div 2) + x) * (1 + 2)) - 1) - 2) - x) - x, 1, x div 2) + x) * (1 + 2)) + 1) - x) - x, 1, x div 2) + x) * (1 + 2)) - 2) * 2) - 1) - x, 1, 2 + (x + x)) div 2) + x
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
(declare-fun f10 (Int Int) Int)
(declare-fun g10 (Int Int) Int)
(declare-fun h10 (Int) Int)
(declare-fun i10 (Int) Int)
(declare-fun j10 (Int) Int)
(declare-fun u10 (Int Int Int) Int)
(declare-fun v10 (Int Int Int) Int)
(declare-fun w10 (Int) Int)
(declare-fun f9 (Int) Int)
(declare-fun g9 () Int)
(declare-fun h9 (Int) Int)
(declare-fun u9 (Int Int) Int)
(declare-fun v9 (Int) Int)
(declare-fun f8 (Int) Int)
(declare-fun g8 () Int)
(declare-fun h8 (Int) Int)
(declare-fun u8 (Int Int) Int)
(declare-fun v8 (Int) Int)
(declare-fun f7 (Int) Int)
(declare-fun g7 () Int)
(declare-fun h7 (Int) Int)
(declare-fun u7 (Int Int) Int)
(declare-fun v7 (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 () Int)
(declare-fun h6 (Int) Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
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
(assert (forall ((x Int)) (= (f1 x) (ite (<= (modf x 2) 0) (divf x (+ 1 2)) 1))))
(assert (forall ((x Int)) (= (g1 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (v1 x))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (divf (* (v0 x) (+ 1 2)) 2) (+ 1 2)) 1))))
(assert (forall ((x Int) (y Int)) (= (f10 x y) (- x y))))
(assert (forall ((x Int) (y Int)) (= (g10 x y) (divf y 2))))
(assert (forall ((x Int)) (= (h10 x) x)))
(assert (forall ((x Int)) (= (i10 x) x)))
(assert (forall ((x Int)) (= (j10 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u10 x y z) (ite (<= x 0) y (f10 (u10 (- x 1) y z) (v10 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v10 x y z) (ite (<= x 0) z (g10 (u10 (- x 1) y z) (v10 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w10 x) (u10 (h10 x) (i10 x) (j10 x)))))
(assert (forall ((x Int)) (= (f9 x) (- (- (+ (* (+ (w10 x) x) (+ 1 2)) 1) x) x))))
(assert (= g9 1))
(assert (forall ((x Int)) (= (h9 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u9 x y) (ite (<= x 0) y (f9 (u9 (- x 1) y))))))
(assert (forall ((x Int)) (= (v9 x) (u9 g9 (h9 x)))))
(assert (forall ((x Int)) (= (f8 x) (- (- (- (- (* (+ (v9 x) x) (+ 1 2)) 1) 2) x) x))))
(assert (= g8 1))
(assert (forall ((x Int)) (= (h8 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u8 x y) (ite (<= x 0) y (f8 (u8 (- x 1) y))))))
(assert (forall ((x Int)) (= (v8 x) (u8 g8 (h8 x)))))
(assert (forall ((x Int)) (= (f7 x) (- (- (+ (* (+ (v8 x) x) (+ 1 2)) 1) x) x))))
(assert (= g7 1))
(assert (forall ((x Int)) (= (h7 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u7 x y) (ite (<= x 0) y (f7 (u7 (- x 1) y))))))
(assert (forall ((x Int)) (= (v7 x) (u7 g7 (h7 x)))))
(assert (forall ((x Int)) (= (f6 x) (- (- (- (- (* (+ (v7 x) x) (+ 1 2)) 1) 2) x) x))))
(assert (= g6 1))
(assert (forall ((x Int)) (= (h6 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 g6 (h6 x)))))
(assert (forall ((x Int)) (= (f5 x) (- (- (+ (* (+ (v6 x) x) (+ 1 2)) 1) x) x))))
(assert (= g5 1))
(assert (forall ((x Int)) (= (h5 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 g5 (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (- (- (- (- (* (+ (v5 x) x) (+ 1 2)) 1) 2) x) x))))
(assert (= g4 1))
(assert (forall ((x Int)) (= (h4 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 g4 (h4 x)))))
(assert (forall ((x Int)) (= (f3 x) (- (- (+ (* (+ (v4 x) x) (+ 1 2)) 1) x) x))))
(assert (= g3 1))
(assert (forall ((x Int)) (= (h3 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 g3 (h3 x)))))
(assert (forall ((x Int)) (= (f2 x) (- (- (* (- (* (+ (v3 x) x) (+ 1 2)) 2) 2) 1) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (+ 2 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (v2 x) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
