;; sequence(s): A158057
;; terms: 1 17 33 49 65 81 97 113 129 145 161 177 193 209 225 241 257 273 289 305
;; small program: 1 + (loop(x * x, 2, 2) * x)
;; fast program: 1 + (2 * (2 * (2 * (x + x))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (+ 1 (* v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (* 2 (* 2 (* 2 (+ x x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
