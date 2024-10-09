;; sequence(s): A47411
;; terms: 1 2 4 6 9 10 12 14 17 18 20 22 25 26 28 30 33 34 36 38
;; small program: ((if (x mod (2 + 2)) <= 0 then 1 else 0) + x) + x
;; fast program: loop(1 + x, 1 - (x mod (2 + 2)), x) + x
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (ite (<= (modf x (+ 2 2)) 0) 1 0) x) x))))
(assert (forall ((x Int)) (= (f0 x) (+ 1 x))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (modf x (+ 2 2))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
