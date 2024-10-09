;; sequence(s): A303298
;; terms: 0 1 18 21 55 60 111 118 186 195 280 291 393 406 525 540 676 693 846 865
;; small program: loop((((if (y mod 2) <= 0 then (2 * (2 * (2 + 2))) else 1) * y) + x) + y, x, 0) div 2
;; fast program: ((((1 + 2) * ((1 + (2 + 2)) * loop((x * x) + x, 1, x div 2))) + (x * x)) + x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (* (ite (<= (modf y 2) 0) (* 2 (* 2 (+ 2 2))) 1) y) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (v0 x) 2))))
(assert (forall ((x Int)) (= (f1 x) (+ (* x x) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (divf x 2))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (* (+ 1 2) (* (+ 1 (+ 2 2)) (v1 x))) (* x x)) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
