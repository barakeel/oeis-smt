;; sequence(s): A268149
;; terms: 0 24 1120 33264 823680 18475600 389398464 7862853600 153876579840 2940343837200 55138611528000 1018383898440480 18574619721465600 335240928272918304 5996573430996184960 106438123408375281600 1876607120325212706816 32891715945378106711440
;; small program: loop(loop(2 * ((x - (x div y)) + x), x, x) * x, 1, x + x)
;; fast program: loop(2 * ((x - (x div y)) + x), x + x, 1) * (2 * ((x + x) * x))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 () Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f1 x y) (* 2 (+ (- x (divf x y)) x)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (forall ((x Int)) (= (h1 x) x)))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) (h1 x)))))
(assert (forall ((x Int)) (= (f0 x) (* (v1 x) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* 2 (+ (- x (divf x y)) x)))))
(assert (forall ((x Int)) (= (g2 x) (+ x x))))
(assert (= h2 1))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) h2))))
(assert (forall ((x Int)) (= (fast x) (* (v2 x) (* 2 (* (+ x x) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
