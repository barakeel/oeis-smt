;; sequence(s): A275365
;; terms: 0 2 2 4 2 6 2 8 2 10 2 12 2 14 2 16 2 18 2 20
;; small program: loop(1 - x, x, 2) mod (2 + x)
;; fast program: if (x mod 2) <= 0 then (if x <= 0 then 0 else 2) else (1 + x)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 1 x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (modf (v0 x) (+ 2 x)))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (modf x 2) 0) (ite (<= x 0) 0 2) (+ 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
