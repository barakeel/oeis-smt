;; sequence(s): A191527
;; terms: 0 0 1 3 9 20 50 105 245 504 1134 2310 5082 10296 22308 45045 96525 194480 413270 831402
;; small program: (1 + loop((x * y) div (y - (y div 2)), x, x - 1)) div 2
;; fast program: (((loop(2 * (((x div y) + x) + x), x div 2, 1 + (x mod 2)) div (1 + x)) * (x - 1)) + 1) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (* x y) (- y (divf y 2))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) (- x 1))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (+ 1 (v0 x)) 2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (+ (divf x y) x) x)))))
(assert (forall ((x Int)) (= (g1 x) (divf x 2))))
(assert (forall ((x Int)) (= (h1 x) (+ 1 (modf x 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (* (divf (v1 x) (+ 1 x)) (- x 1)) 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
