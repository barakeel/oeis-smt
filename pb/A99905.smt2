;; sequence(s): A99905
;; terms: 0 1 1 3 1 0 1 3 1 8 1 2 1 10 0 3 1 12 1 10
;; small program: (loop(2 * (((x div y) + x) + x), 1 + x, 1) div 2) mod (1 + x)
;; fast program: loop((((2 * (y + y)) - 2) * x) div (1 + y), x, 0 - 1) mod (1 + x)
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
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* 2 (+ (+ (divf x y) x) x)))))
(assert (forall ((x Int)) (= (g0 x) (+ 1 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (modf (divf (v0 x) 2) (+ 1 x)))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (divf (* (- (* 2 (+ y y)) 2) x) (+ 1 y)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 (- 0 1)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (modf (v1 x) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
