;; sequence(s): A40553
;; terms: 24 24 48 24 48 24 48 24 48 24 48 24 48 24 48 24 48 24 48 24
;; small program: loop(x * y, 2 + 2, (if x <= 0 then 1 else 2) - (x mod 2))
;; fast program: 2 * (2 * (2 * ((1 + 2) * ((if x <= 0 then 1 else 2) - (x mod 2)))))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* x y))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) (- (ite (<= x 0) 1 2) (modf x 2)))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* 2 (* 2 (* (+ 1 2) (- (ite (<= x 0) 1 2) (modf x 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
