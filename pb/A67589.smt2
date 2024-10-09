;; sequence(s): A67589
;; terms: 1 5 7 15 35 51 57 77 117 145 155 187 247 287 301 345 425 477 495 551
;; small program: loop2(x + y, 1 + y, (2 + x) - ((x div 2) mod 2), 0, x) - x
;; fast program: ((((((((loop(0, (x mod (2 + 2)) - 1, 2) + x) * 2) + x) - 2) * (x + 1)) div 2) div 2) * 2) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 () Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int) (y Int)) (= (g0 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (h0 x) (- (+ 2 x) (modf (divf x 2) 2)))))
(assert (= i0 0))
(assert (forall ((x Int)) (= (j0 x) x)))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w0 x) (u0 (h0 x) i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (- (w0 x) x))))
(assert (= f1 0))
(assert (forall ((x Int)) (= (g1 x) (- (modf x (+ 2 2)) 1))))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y f1))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (divf (divf (* (- (+ (* (+ (v1 x) x) 2) x) 2) (+ x 1)) 2) 2) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
