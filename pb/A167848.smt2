;; sequence(s): A167848-A167958-A168719-A168767-A168815-A168863-A168911-A168959-A169007-A169055-A169103-A169151-A169199-A169247-A169295-A169343-A169391-A169439-A169487-A169535-A170003-A170051-A170099-A170147-A170195-A170243-A170291-A170339-A170387-A170435-A170483-A170531-A170579-A170627-A170675-A170723-A170761
;; terms: 1 42 1722 70602 2894682 118681962 4865960442 199504378122 8179679503002 335366859623082 13750041244546362 563751691026400842 23113819332082434522 947666592615379815402 38854330297230572431482
;; small program: loop((loop((x * x) + x, 2, 2) - (1 mod x)) * x, x, 1)
;; fast program: loop2(x * y, y, x - 1, 1, 1 + (2 * (2 * (2 + (2 * (2 + 2)))))) * (if x <= 0 then 1 else loop((x * x) + x, 1, 2 + (2 + 2)))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (+ (* x x) x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (* (- v1 (modf 1 x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (forall ((x Int)) (= (h2 x) (- x 1))))
(assert (= i2 1))
(assert (= j2 (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 2))))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) i2 j2))))
(assert (forall ((x Int)) (= (f3 x) (+ (* x x) x))))
(assert (= g3 1))
(assert (= h3 (+ 2 (+ 2 2))))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (= v3 (u3 g3 h3)))
(assert (forall ((x Int)) (= (fast x) (* (w2 x) (ite (<= x 0) 1 v3)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
