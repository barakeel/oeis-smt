;; sequence(s): A217290
;; terms: ~6 ~4 ~3 ~2 ~1 1 2 3 4 6
;; small program: ((loop((x - y) div 2, 2, x) - 2) - 2) + x
;; fast program: (((((x - 1) div (2 + 2)) - 1) - 2) - 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (divf (- x y) 2))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (- (- (v0 x) 2) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (- (- (- (divf (- x 1) (+ 2 2)) 1) 2) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
