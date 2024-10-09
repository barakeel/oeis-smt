;; sequence(s): A139175
;; terms: 23 143 1007 8063 72575 725759 7983359 95800319 1245404159 17435658239 261534873599 4184557977599 71137485619199 1280474741145599 24329020081766399 486580401635327999
;; small program: (loop((((2 mod y) + y) * x) + x, 2 + x, 2) * 2) - 1
;; fast program: (loop(x * y, 1 + (2 + (2 + x)), 1) div (1 + (2 + 2))) - 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ (modf 2 y) y) x) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (- (* (v0 x) 2) 1))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* x y))))
(assert (forall ((x Int)) (= (g1 x) (+ 1 (+ 2 (+ 2 x))))))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (- (divf (v1 x) (+ 1 (+ 2 2))) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
