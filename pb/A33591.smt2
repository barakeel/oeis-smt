;; sequence(s): A33591
;; terms: 1 60 315 910 1989 3696 6175 9570 14025 19684 26691 35190 45325 57240 71079 86986 105105 125580 148555 174174
;; small program: loop(1 + (x + y), 2 * (x + x), 1) * (1 + ((x + x) + x))
;; fast program: (1 + ((x + x) + x)) * ((1 + (x + x)) * (1 + (2 * (x + x))))
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 1 (+ x y)))))
(assert (forall ((x Int)) (= (g0 x) (* 2 (+ x x)))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (v0 x) (+ 1 (+ (+ x x) x))))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (+ (+ x x) x)) (* (+ 1 (+ x x)) (+ 1 (* 2 (+ x x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
